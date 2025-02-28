<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="currentUrl" value="${pageContext.request.requestURI}" />

<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">
                    <span>Main Menu</span>
                </li>
                <li class="submenu">
                    <!--<a href="#"><i class="fas fa-user-graduate"></i> <span id="logoid"> Management</span> <span class="menu-arrow"></span></a>-->
                    <!--<ul>-->
                        <li><a href="${contextPath}/teacher?action=list" class="${(currentUrl.contains('teacher') or currentUrl.contains('assign-subject')) ? 'active' : ''}">Teachers</a></li>
                        <li><a href="${contextPath}/student?action=list" class="${currentUrl.contains('student') ? 'active' : ''}">Students</a></li>
                        <li><a href="${contextPath}/class?action=list" class="${currentUrl.contains('class') ? 'active' : ''}">Classes</a></li>
                        <li><a href="${contextPath}/assessment?action=list" class="${currentUrl.contains('assess') ? 'active' : ''}">Assessment</a></li>
                        <li><a href="${contextPath}/subject?action=list" class="${currentUrl.contains('subject')   ? 'active' : ''}">Subject</a></li>
                        <li><a href="${contextPath}/material?action=list" class="${currentUrl.contains('material')   ? 'active' : ''}">Materials</a></li>
                        <li><a href="${contextPath}/schedule-manage" class="${(currentUrl.contains('schedule') or currentUrl.contains('attendance')) ? 'active' : ''}">Schedule</a></li>
                        <li><a href="${contextPath}/exam" class="${(currentUrl.contains('exam')) ? 'active' : ''}">Exam</a></li>

                    <!--</ul>-->
                </li>
            </ul>
        </div>
    </div>
</div>

<script>
    // Add this JavaScript to your script file or within a <script> tag in your HTML
    document.addEventListener('DOMContentLoaded', (event) => {
        const menuItems = document.querySelectorAll('.sidebar .sidebar-menu ul ul li a');

        menuItems.forEach(item => {
            item.addEventListener('click', function (event) {
                menuItems.forEach(el => el.classList.remove('active'));
                this.classList.add('active');
            });
        });
    });
</script>
<script type="text/javascript">
    document.getElementById("logoid").addEventListener("click", function (event) {
        event.preventDefault();
        var userRole = "${sessionScope.user.role}";
        var contextPath = "${contextPath}";
        if (userRole === "headmaster") {
            window.location.href = contextPath + "/headmaster/dashboard";
        } else if (userRole === "teacher") {
            window.location.href = contextPath + "/teacher/dashboard";
        } else if (userRole === "student") {
            window.location.href = contextPath + "/student/dashboard";
        }
    });
</script>