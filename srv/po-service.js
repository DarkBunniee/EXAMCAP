const cds = require('@sap/cds');

module.exports = async function () {

  const { POHeaders, POItems } = this.entities;

  /**
   * Calculate totalAmount before saving POHeader
   */
  this.before(['CREATE', 'UPDATE'], POHeaders, async (req) => {
    const { items } = req.data;

    if (items && items.length > 0) {
      let total = 0;
      for (const item of items) {
        total += (item.quantity || 0) * (item.price || 0);
      }
      req.data.totalAmount = total;
    }
  });

  /**
   * Recalculate POHeader total when POItems change
   */
  this.after(['CREATE', 'UPDATE', 'DELETE'], POItems, async (data, req) => {
    const poHeaderId = data.poHeader_ID || req.data.poHeader_ID;
    if (!poHeaderId) return;

    const items = await SELECT.from(POItems).where({ poHeader_ID: poHeaderId });

    let total = 0;
    for (const item of items) {
      total += (item.quantity || 0) * (item.price || 0);
    }

    await UPDATE(POHeaders)
      .set({ totalAmount: total })
      .where({ ID: poHeaderId });
  });

};
