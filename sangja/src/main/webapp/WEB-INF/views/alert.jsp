<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    var msg = "<c:out value='${msg}'/>";
    var url = "<c:out value='${url}'/>";
    alert(msg);
    location.href = url;
</script>