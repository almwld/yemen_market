const COMMISSION_PERCENT = 0.05; // 5%

function calculateCommission(total) {
  return total * COMMISSION_PERCENT;
}

module.exports = {
  calculateCommission,
};
