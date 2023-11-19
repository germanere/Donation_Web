<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Quản trị</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/static/admin1/assets/css/styles.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/admin1/assets/js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>

  <script src="${pageContext.request.contextPath}/static/admin1/assets/js/datatables-simple-demo.js"></script>

  <script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>

<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
  <nav th:fragment="html_nav" class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="/PRJ321_ASM01_4.0/admin">QUẢN TRỊ</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
            class="fas fa-bars"></i></button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

    </form>
    <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a th:if="${session.admin}" class="nav-link dropdown-toggle" href="/admin/logout" role="button" ><i class="fas fa-user fa-fw"></i><span> Logout</span></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
                    <li><a class="dropdown-item" href="#">Settings</a></li>
                    <li><a class="dropdown-item" href="#">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="admin/logout">Logout</a></li>
                </ul>
            </li>
        </ul>
</nav>
</nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <div th:fragment="html_menu" id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
              <div class="nav">
                  <a class="nav-link" href="admin/account">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý người dùng
                  </a>
                  <a class="nav-link" href="admin/donation">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý đợt quyên góp
                  </a>
              </div>
          </div>

      </nav>
  </div>
  </div>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Chi tiết đợt quyên góp</h1>
        <div class="card mb-4">

          <div class="card-body">
            <!--Detail-->
            <div class="row">
              <div class="col-6">
                <label for="addname"
                       class="col-form-label">Mã đợt quyên góp:</label>
                <input type="text" class="form-control"
                       id="addname" name="code" value="${donation.code}" readonly="readonly">
              </div>
              <div class="col-6">
                <label for="addcost"
                       class="col-form-label">Tên đợt quyên góp:</label>
                <input type="text" class="form-control"
                       id="addcost" name="name" value="${donation.name}" readonly="readonly">
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <label for="addname"
                       class="col-form-label">Ngày bắt đầu:</label>
                <input type="date" class="form-control"
                       id="addname" name="start" value="${donation.dStart}" readonly="readonly">
              </div>
              <div class="col-6">
                <label for="addcost"
                       class="col-form-label">Ngày kết thúc:</label>
                <input type="date" class="form-control"
                       id="addcost" name="end" value="${donation.dEnd}" readonly="readonly">
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <label for="addname"
                       class="col-form-label">Tổng tiền quyên góp:</label>
                <input type="text" class="form-control"
                       id="addname" name="start" value="${donation.money}" readonly="readonly">
              </div>
              
			<div class="col-6">
    		<label for="addcost" class="col-form-label">Trạng thái:</label>
    		<input type="text" class="form-control" id="addcost" name="end"
           value="<c:if test='${donation.status == 0}'>CREATED</c:if>
           <c:if test='${donation.status == 1}'>PROCESSING</c:if>
           <c:if test='${donation.status == 2}'>END</c:if>
           <c:if test='${donation.status == 3}'>CLOSE</c:if>"
           readonly="readonly" />
			</div>
			
            </div>
            <div class="row">
              <div class="col-6">
                <label for="addname"
                       class="col-form-label">Tổ chức:</label>
                <input type="text" class="form-control"
                       id="addname" name="tochuc" value="${donation.dOrg}" readonly="readonly">
              </div>
              <div class="col-6">
                <label for="addcost"
                       class="col-form-label">Số điện thoại:</label>
                <input type="number" class="form-control"
                       id="addcost" name="sdt" value="${donation.phonenum}" readonly="readonly">
              </div>
              <div class="col-12">
                <label for="ct_id" class="col-form-label">Nội dung:</label>
                <textarea name="noidung" class="form-control" cols="50" value="${donation.ddescribe}" readonly="readonly"></textarea>
              </div>
            </div>
            <!--Detail-->
            <h3 class="mt-4">Danh sách những người quyên góp</h3>
            <table id="datatablesSimple">
              <thead>
              <tr style="background-color: gray !important;">
                <th>Họ Tên</th>
                <th>Tiền quyên góp</th>
                <th>Ngày quyên góp</th>
                <th>Nội dung</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
              </tr>
              </thead>
              <tfoot>
              <tr>

              </tr>
              </tfoot>
              <tbody>
              <input type="hidden" value="${donations.size()}" id="dodai" />
              	<c:forEach var="dnt" items="${donation.userDonations}">
                <tr>
                  <td>${dnt.name}</td>
                  <td>${dnt.money}</td>
                  <td>${donation.dStart}</td>
                  <td>${donation.ddescribe}</td>			  
                  <c:if test = "${donation.status==0}">
                     <td>Chờ Xác Nhận</td>
                     <td style="display: flex; justify-content: space-between">
                      <button type="submit" style="width: 105px" class="btn btn-success"  >
                        Xác nhận
                      </button>
                      </td>
                  </c:if>
                  <c:if test = "${donation.status==1}">
                     <td>Chờ Xác Nhận</td>
                     <td style="display: flex; justify-content: space-between">
                      <button type="submit" style="width: 105px" class="btn btn-success"  >
                        Xác nhận
                      </button>
                      </td>
                  </c:if>
                  <c:if test = "${donation.status==2}">
                     <td>Đã Quyên Góp</td>
                      <td style="display: flex;justify-content: space-between">
                        <button type="submit" style="width: 150px" class="btn btn-danger" >
                        Hủy xác nhận
                        </button>
                        </td>
                  </c:if>
                  <c:if test = "${donation.status==3}">
                     <td>Đóng Quyên Góp</td>
                  </c:if>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>

    </main>

    <script>

      ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
      })
              .catch(error => {
                console.error(error);
              });

    </script>
    <script>

      var dodai = document.getElementById("dodai").value;
      var a = parseInt(dodai);
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
    <footer class="py-4 bg-light mt-auto">
      <div class="container-fluid px-4">

      </div>
    </footer>
  </div>
</div>

	<script src="${pageContext.request.contextPath}/static/admin1/assets/js/JQuery3.3.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/admin1/assets/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
	<script src="${pageContext.request.contextPath}/static/admin1/assets/js/datatables-simple-demo.js"></script>
</body>

</html>