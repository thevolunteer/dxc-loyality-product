<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MyShop Admin - Dashboard</title>

<!-- Bootstrap core CSS-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css" />

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.css" rel="stylesheet">

<!-- Page level plugin CSS-->
<link
	href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />



<!-- Custom styles for this template-->
<link href="css/main-admin.css" rel="stylesheet">
<link href="css/product-manage.css" rel="stylesheet">

</head>

<body id="page-top">

	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">
		<a class="navbar-brand" href="#"> <img src="img/logo-myshop.JPG"
			class="img-logo">
		</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" >
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar Search -->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for..."
					aria-label="Search" aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a href="#editAccountModal" class="dropdown-item"
						data-toggle="modal">Account</a>
					<!-- <a class="dropdown-item" href="#">Activity Log</a> -->
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>

	</nav>

	<div id="wrapper">
		<!-- Sidebar -->
			<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="\product"> <i
					class="fas fa-box-open"></i> <span>Product Manager</span></a></li>
			<li class="nav-item"><a class="nav-link" href="\customer"> <i
					class="fas fa-user"></i> <span>Customer Manager</span></a></li>
			<li class="nav-item"><a class="nav-link" href="\order"> <i
					class="fas fa-fw fa-table"></i> <span>Order Manager</span></a></li>
		</ul>
		<div id="content-wrapper">
			<div class="container-fluid">
				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Manage Product
					</div>
					<!--  -->
					<div class="card-header">
						<a href="#addProductModal" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th>Product ID</th>
										<th>Product name</th>
										<th>Price</th>
										<th>Point</th>
										<th>Action</th>										
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${product}" var="product">
										<tr>
											<td>${product.prodid}</td>
											<td>${product.name}</td>
											<td>${product.price}</td>
											<td>${product.point}</td>
											<td><a href="#editProductModal" class="edit"
												data-product-id="${product.prodid}"
												data-product-name-todo="${product.name}"
												data-price-todo="${product.price}"
												data-point-todo="${product.point}" data-toggle="modal">
												<i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
												<a href="/product/delete/${product.prodid}" class="delete">
												<i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
				<!-- Add Modal HTML -->
				<div id="addProductModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="/product/save" method="POST"
								enctype="multipart/form-data">
								<div class="modal-header">
									<h4 class="modal-title">Add Product</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>Product Name</label> <input type="text" name="name"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label>Price</label> <input type="number" name="price"
											class="form-control" min="100000" required>
									</div>
									<div class="form-group">
										<label>Point</label> <input type="number" name="point"
											class="form-control" min="1" required>
									</div>
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default"
										data-dismiss="modal" value="Cancel"> <input
										type="submit" class="btn btn-success" value="Add">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Edit Modal HTML -->
				<div id="editProductModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form action="/product/update" method="POST"
								enctype="multipart/form-data">
								<div class="modal-header">
									<h4 class="modal-title">Edit Product</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label>Product ID</label> <input type="text"
											class="form-control" name="prodid" id="prodid">
									</div>
									<div class="form-group">
										<label>Product Name</label> <input type="text" name="name"
											class="form-control" required>
									</div>
									<div class="form-group">
										<label>Price</label> <input type="number" class="form-control"
											name="price" min="0" required>
									</div>
									<div class="form-group">
										<label>Point</label> <input type="number" name="point"
											class="form-control" min="0" required>
									</div>

								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default"
										data-dismiss="modal" value="Cancel"> <input
										type="submit" class="btn btn-info" value="Save">
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- Delete Modal HTML -->
				<div id="deleteProductModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<form>
								<div class="modal-header">
									<h4 class="modal-title">Delete Product</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body">
									<p>Are you sure you want to delete these Records?</p>
									<p class="text-warning">
										<small>This action cannot be undone.</small>
									</p>
								</div>
								<div class="modal-footer">
									<input type="button" class="btn btn-default"
										data-dismiss="modal" value="Cancel"> <input
										type="submit" class="btn btn-danger" value="Delete">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Internet, All rights reserved</span>
				</div>
			</div>
		</footer>

	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/datatables/jquery.dataTables.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>



	<!-- Custom scripts for all pages-->
	<script src="js/myshop-admin.js"></script>
	<script src="js/product-manage.js"></script>

	<!--  -->
	<script>
		$(document)
				.ready(
						function() {
							$('#dataTable').DataTable();
							$('select').selectpicker({
								minDate:-1
							});
							$('#editProductModal')
							.on(
									'show.bs.modal',
									function(e) {
										var prodId = $(e.relatedTarget)
												.data('product-id');
										var prodName = $(
												e.relatedTarget).data(
												'product-name-todo');
										var price = $(e.relatedTarget)
												.data('price-todo');
										var point = $(
												e.relatedTarget).data(
												'point-todo');
										$(e.currentTarget).find(
												'input[name="prodid"]')
												.val(prodId);
										$(e.currentTarget)
												.find(
														'input[name="name"]')
												.val(prodName);
										$(e.currentTarget).find(
												'input[name="price"]')
												.val(price);
										$(e.currentTarget)
												.find(
														'input[name="point"]')
												.val(point);
									});
						});
		document.getElementById('prodid').readOnly = true;
	</script>
	</div>
</body>

</html>