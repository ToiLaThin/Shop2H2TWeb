<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>
<style>
    .myModal {
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1;
        display: none;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.4);
    }

    .myModalContent {
        width: 60%;            
        margin: 10% auto;
        background-color: #fefefe;
        box-shadow: 1px 1px 20px 2px rgba(0,0,0,0.2);
        border-radius: 5px;
        animation-name: moveFade;
        animation-duration: 2.4s;            
    }

    #myModalCloseBtn {
        float: right;
        font: bold 40px sans-serif;
        color: gray;
        cursor: pointer;
    }

    .myModalHeader::after {
        display: table;
        content: "";
        clear: both;
    }

    .myModalHeader {
        padding: 15px;
    }

    #myModalCloseBtn:hover, #myModalCloseBtn:focus {
        color: black;
    }

    .myModalBody {
        height: 400px;
        padding: 40px;
        background-color: white;
        /*quan trọng khi có quá nhiều icon trong modal*/
        overflow-y: scroll;
    }        

    .myProfileIcon {
        cursor: pointer;
        transition: .4s ease-in-out;
    }
    .myProfileIcon:hover {
        transform: scale(1.2);
        opacity: 0.9;
    }

    @@keyframes moveFade {
        from {
            top: 500px;
            opacity: 0;
        }

        to {
            top: 0;
            opacity: 1;
        }
    }
</style>
<!-- boostrap icons -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js" integrity="sha512-1/RvZTcCDEUjY/CypiMz+iqqtaoQfAITmNSJY17Myp4Ms5mdxPS5UV7iOfdZoxcGhzFbOm6sntTKJppjvuhg4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<section style="background-color: #eee;">
    <div class="container py-5">
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                    	<c:if test="${account.images != null}">
                            <img id="myAvatar" src="${account.images}" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;height:150px;">
                    	</c:if>
                        <c:if test="${account.images == null}">
                            <img id="myAvatar" src="<%=request.getContextPath()%>/img/user.jpg" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;height:150px;">
                        </c:if>
                        <h5 class="my-3">${account.username}</h5>
                        <p class="text-muted mb-1">Full Stack Developer</p>
                        <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                        <div class="d-flex justify-content-center mb-2">
                            <button id="myBtnEditProfile" type="button" class="btn border-0 btn-outline-primary rounded-circle"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <button id="myBtnEditProfilePicture" type="button" class="btn border-0 btn-outline-primary rounded-circle"><i class="fas fa-image" aria-hidden="true"></i></button>
                            <a href="<%=request.getContextPath()%>/common/home" class="btn border-0 btn-outline-primary rounded-circle"><i class="fa fa-home"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-8">
                <div class="card mb-4">
                	<c:url value="/common/account/profileUpdate" var="profileUpdateControllerUrl"></c:url>
                    <form method="post" action="${profileUpdateControllerUrl }">
                        <div class="card-body">
                            <div class="row form-group">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <input type="text" name="accountFullname" value="${account.fullname}" class="text-muted form-control" readonly="readonly" />
                                </div>
                            </div>
                            <hr>
                            <div class="row form-group">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <input type="email" name="accountEmail" value="${account.email}" class="text-muted form-control" readonly="readonly" />
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Phone</p>
                                </div>
                                <div class="col-sm-9">
                                    <input type="tel" name="accountPhone" value="${account.phone}" class="text-muted form-control" readonly="readonly" pattern="[0][0-9]{3}[0-9]{3}[0-9]{3}" />
                                </div>
                            </div>
                            <hr>                            
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">Unknow, remain secret</p>
                                </div>
                            </div>
                            <hr>  
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Icon URL</p>
                                </div>
                                <div class="col-sm-9">
                                    <input id="myAvatarPathInput" type="text" name="accountImages" value="${account.images}" class="text-muted form-control" readonly="readonly" />
                                    <input name="accountId" type="hidden" value="${accountId}" />
                                </div>
                            </div>
                        </div>

                        <div class="card-footer d-flex justify-content-center mb-2">
                            <button id="myProfileSubmitBtn" type="submit" class="btn btn-outline-success">Submit</button>
                        </div>
                    </form>
                </div>
                <div class="card mb-4 mb-lg-0">
                    <div class="card-body p-0">
                        <ul class="list-group list-group-flush rounded-3">
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fas fa-globe fa-lg text-warning"></i>
                                <p class="mb-0">https://mdbootstrap.com</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                                <p class="mb-0">mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                                <p class="mb-0">@@mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                <p class="mb-0">mdbootstrap</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                <p class="mb-0">mdbootstrap</p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="myModal">
        <div class="myModalContent">
            <div class="myModalHeader">
                <span id="myModalCloseBtn">&times;</span>
                <h2 class="toast-header">
                    <i class="fas fa-image" style="padding-right:12px; font-size: 40px; color: lightgray;"></i>
                    Choose image:
                </h2>
            </div>
            <div class="myModalBody d-flex flex-wrap justify-content-center align-items-center">
                <!-- @foreach(var iconPath in Model.IconPaths)
                        {
                    //phải có / trước @iconPath để html biết lấy root 
                    <div class="m-4 myProfileIcon">
                        <img src="/@iconPath" width="120" height="120"/>
                    </div>
                } -->
            </div>
        </div>
    </div>
</section>

 <script>
     $(document).ready(function () {
         $("#myProfileSubmitBtn").hide();
         $("#myBtnEditProfilePicture").click(function () {
             $(".myModal").fadeIn();
         });
         $("#myModalCloseBtn").click(function () {
             $(".myModal").fadeOut();
         });
         
         $("#myAvatarPathInput").bind("change paste keyup", function() {
        	 if($(this).val() === "")
       		 {
        		 let root = "${pageContext.request.contextPath}"
        		 document.getElementById("myAvatar").src = root + "/img/user.jpg";
       		 }
        	 else
       	   	 	document.getElementById("myAvatar").src = $(this).val();
       	});
     });

     //code cho phần thay đổi icon
     /* let currIconRelativePath = "";
     let allIcons = document.querySelectorAll(".myProfileIcon");
     for (let i = 0; i < allIcons.length; i++) {
         allIcons[i].addEventListener("click", function (evt) {
             for (let j = 0; j < allIcons.length; j++) {
                 allIcons[j].children[0].style.border = "0px solid white";
             }
             //evt.Target là img chứa trong .MyProfileIcon nên nếu đổi style cho allIcon[j] thì không đúng
             evt.target.style.border = "2px solid dodgerblue";

             currIconRelativePath = evt.target.src;
             //là đường dẫn có https://localhost ... -> ko nên lưu đường dẫn này vào Db mà chỉ nên đưa đường dẫn tương đối
             let posToTakeSubStr = currIconRelativePath.indexOf("/assets");
             currIconRelativePath = currIconRelativePath.slice(posToTakeSubStr, currIconRelativePath.length);

             document.getElementById("myAvatar").src = currIconRelativePath;
             document.getElementById("myAvatarPathInput").value = currIconRelativePath;
         });
     } */


     let myEditProfileBtn = document.getElementById("myBtnEditProfile");
     myEditProfileBtn.addEventListener("click", function () {
         let inputs = document.querySelectorAll("input.text-muted");
         console.log(inputs);
         for (var i = 0; i < inputs.length; i++) {
             if (inputs[i].readOnly === true) {
                 inputs[i].readOnly = false;
                 $("#myProfileSubmitBtn").show();
             }
             else {
                 inputs[i].readOnly = true;
                 $("#myProfileSubmitBtn").hide();
             }
         }
     });
 </script>
