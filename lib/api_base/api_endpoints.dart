enum Endpoint {
  getHomeAds,
  getMainCategories,
  getSubCategories,
  getAllDrinks,
  getBranchesAddresses,
  getRestaurantFees,
  getRestaurantMoreInfo,
  getDiscount,
  getCouponUsed,
}

Map<Endpoint, String> endpoint = {
  Endpoint.getHomeAds: "ads",
  Endpoint.getMainCategories: "categories",
  Endpoint.getSubCategories: "categories/products/",
  Endpoint.getAllDrinks: "drinks",
  Endpoint.getBranchesAddresses: "branches",
  Endpoint.getRestaurantFees: "accounts",
  Endpoint.getRestaurantMoreInfo: "socials",
  Endpoint.getDiscount: "coupons/discount",
  Endpoint.getCouponUsed : 'coupons/used',
};

const String moreInfo = "categories";