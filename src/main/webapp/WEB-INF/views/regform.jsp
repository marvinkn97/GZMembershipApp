<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.Date, java.util.Calendar"%>


<%
// Step 1: Retrieve the current date
Date currentDate = new Date();

// Step 2: Add duration in months
Calendar calendar = Calendar.getInstance();
calendar.setTime(currentDate);
//calendar.add(Calendar.MONTH, m.duration); // Add 3 months, adjust as needed
Date futureDate = calendar.getTime();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<title>Membership Registration</title>
</head>
<body>

	<main>

		<div class="container-md mt-4">

			<c:if test="${msg ne null}">
				<div class="alert alert-success" id="alId" role="alert">${msg}</div>
			</c:if>

			<h2 class="text-center display-4 mt-3">Membership Registration</h2>

			<div class="card mt-4">
				<div class="card-header">Membership Registration Form</div>
				<div class="card-body">

					<form action="./registerMember" method="post">
						<div class="row">

							<div class="form-group col-md-4">
								<label for="nameId">Name</label> <input type="text"
									class="form-control" id="nameId" name="name"
									placeholder="Enter Name">
							</div>

							<div class="form-group col-md-4">
								<label for="emailId">Email</label> <input type="text"
									class="form-control" id="emailId" name="email"
									placeholder="Enter email">
							</div>

							<div class="form-group col-md-4">
								<label for="phoneId">Phone</label> <input type="text"
									class="form-control" id="phoneId" name="phoneNo"
									placeholder="Enter Mobile Number">
							</div>

						</div>
						<div class="row">

							<div class="form-group col-md-3">
								<label for="dobId">Date of Birth</label> <input type="date"
									class="form-control" id="dobId" name="dob"
									placeholder="Enter Date of Birth</">
							</div>

							<div class="form-group col-md-3">
								<label for="sbId">Subscription Type</label> <select
									class="form-control" name="subscription" id="sbId">
									<option value="0">--select--</option>
									<c:forEach items="${subs}" var="sub">
										<option value="${sub.subscriptionId}">${sub.subscriptionName}</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group col-md-3">
								<label for="durationId">Duration in months</label> <input
									type="number" class="form-control" id="durationId"
									name="duration" min="0" onchange="calcTotalCost()">
							</div>

							<div class="form-group col-md-3">
								<label for="totalId">Total Cost</label> <input type="text"
									class="form-control" id="totalId" readonly="readonly">
							</div>


						</div>
						<div class="mt-2 text-center">
							<input type="submit" class="btn btn-success" value="Save">
							<input type="reset" class="btn btn-warning" value="Clear">
						</div>
					</form>
				</div>
			</div>

			<div class="p-3">
				<h3>All Subscription Data</h3>
				<table class="table table-bordered table-striped mt-3">
					<thead class="thead-dark">
						<tr>
							<th>#SNO</th>
							<th>Name</th>
							<th>DOB</th>
							<th>Phone</th>
							<th>Subscription Type</th>
							<th>Valid From</th>
							<th>Expired on</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody id="tbid">
						<c:forEach items="${memberships}" var="m" varStatus="counter">
							<tr>
								<td>${counter.count}</td>
								<td>${m.name}</td>
								<td><fmt:formatDate value="${m.dob}" pattern="yyyy-MM-dd" /></td>
								<td>${m.phoneNo}</td>
								<td>${m.subscription.subscriptionName}</td>
								<td><fmt:formatDate value="<%=new Date()%>"
										pattern="yyyy-MM-dd" /></td>
								<td></td>
								<td>
									<div class="text-center">
										<a href="./deleteMember?membershipId=${m.memberId}"
											class="btn btn-sm btn-danger text-white">Delete</a> <a
											href="./upgradePlan"
											class="btn btn-sm btn-warning text-white">Upgrade Plan</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</main>

	<script type="text/javascript">
	
	
	$(document).ready(function() {
		setTimeout(function() {
			document.getElementById("alId").style.display = 'none';
		}, 3000);
	});
	
		function calcTotalCost() {
			var dId = $("#durationId").val();
			var subId = $("#sbId").val();
			console.log(dId);
			console.log(subId);

			$.ajax({
				type : 'GET',
				url : 'calculateTotalCost', // Replace with the actual API endpoint
				data : {
					subscriptionId : subId,
					duration : dId
				},
				success : function(data) {
					// Assuming 'data' is HTML content, use .html() to set it inside the element with id 'tbid'
					$('#totalId').val(data);
				},
				error : function(xhr, status, error) {
					console.error('Error fetching data:', status, error);
				}
			});
		}
	</script>
</body>
</html>