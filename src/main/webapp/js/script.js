function add_to_cart(pid, pname, pprice) {

	let cart = localStorage.getItem("cart");

	if (cart == null) {
		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: pprice}
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
	}
	else {

		let pcart = JSON.parse(cart);
		
		let oldProduct = pcart.find((item) => item.productId == pid);

		if (oldProduct) {

			oldProduct.productQuantity = oldProduct.productQuantity + 1;

			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})

			localStorage.setItem("cart", JSON.stringify(pcart));


		} else {
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: proce }
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
		}

	}
}