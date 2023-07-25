<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ include file="/common/taglib.jsp" %>
<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="/user/index"><img src="/templates/user/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="/user/index">Home</a></li>
              <li class="nav-item active"><a class="nav-link" href="/user/category">Shop</a></li>
              
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Blog</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="/user/blog">Blog</a></li>
                  <li class="nav-item"><a class="nav-link" href="/user/single-blog">Blog Details</a></li>
                </ul>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Pages</a>
                <ul class="dropdown-menu">
                <c:if test="${!isLogin}">
					
					<li class="nav-item"><a class="nav-link" href="/user/login">Login</a></li>
                 	 <li class="nav-item"><a class="nav-link" href="/user/register">Register</a></li>
				</c:if>
				<c:if test="${isLogin}">
					<c:if test="${admin}">
						<a href="/admin/index" class="login-panel"><i
							class="fa fa-user"></i>Administration</a>
					</c:if>
					<div class="top-social">
						<a href="/user/profile" class="text-primary"
							style="font-weight: bolder;">${fullname}</a> <a
							class="text-danger" id="btnLogOff" href="/logout" title="">[Logout]</a>
					</div>
				</c:if>

                  <li class="nav-item"><a class="nav-link" href="/user/tracking-order">Tracking</a></li>
                </ul>
              </li>
              <li class="nav-item"><a class="nav-link" href="/user/contact">Contact</a></li>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item" ><button  ><a href="/user/cart"><i  class="ti-shopping-cart"></i><span  class="nav-shop__circle">!</span></a></button> </li>
              <li class="nav-item"><a class="button button-header" href="/user/cart">Buy Now</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>