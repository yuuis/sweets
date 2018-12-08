Role.create(name: "admin")
Role.create(name: "panpy")

User.create(name: "しゃりかえ", password: "3lkjas0d98f34l3jk4t", balance: 3500, role_id: 2)
User.create(name: "いしぐろ", password: "3lkh4jg0dfkj345hl23", balance: 10000, role_id: 2)

Idm.create(user_id: 1, value: "123abc")
Idm.create(user_id: 2, value: "456def")

Product.create(name: "カップラーメン", price: 130, image: "https://3.bp.blogspot.com/-rZMHLcW6Er4/WlGpO69KN7I/AAAAAAABJlg/KgmrOkMSuoM0Xf0qRil3iOpMlGer-ypmACLcBGAs/s800/food_cup_ramen_miso.png", deleted: false)
Product.create(name: "アイス", price: 100, image: "https://2.bp.blogspot.com/-t7fJ99VE-HY/W64DlIeosgI/AAAAAAABPH8/fzyUKstvUT0mu7Aqt1em7Lms0ttprj_tQCLcBGAs/s800/icecream_cup_spoon_wood.png", deleted: false)

Purchase.create(user_id: 1, paid: false)
Purchase.create(user_id: 1, paid: true)

PurchasedProducts.create(purchase_id: 1, quantity: 2, product_id: 1)
PurchasedProducts.create(purchase_id: 2, quantity: 1, product_id: 2)
