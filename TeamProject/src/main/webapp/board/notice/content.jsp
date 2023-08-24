<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세조회</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #35424a;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
        }
        .notice {
            border: 1px solid #ccc;
            background-color: white;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
        }
        .notice h2 {
            margin-top: 0;
        }
         .add-button {
            text-align: center;
            margin-top: 20px;
        }
        .add-button button {
            background-color: #35424a;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <header>
        <h1>공지사항 상세조회</h1>
    </header>
    <div class="container">
        <div class="notice">
            <h2>중요한 공지</h2>
            <p>이번 주에는 휴무일이 있습니다. 자세한 내용은 확인해주세요.</p>
            <small>작성일: 2023-08-23</small>
        </div>
    </div>
</body>
</html>
