<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Office Login Portal</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background: linear-gradient(
        135deg,
        #ff6b6b,
        #feca57,
        #48dbfb,
        #5f27cd
    );
    background-size:400% 400%;
    animation:gradient 10s ease infinite;
}

@keyframes gradient{
    0%{background-position:0% 50%;}
    50%{background-position:100% 50%;}
    100%{background-position:0% 50%;}
}

.login-box{
    width:400px;
    padding:40px;
    border-radius:20px;
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(15px);
    box-shadow:0 8px 32px rgba(0,0,0,0.25);
    text-align:center;
    color:white;
}

.login-box h1{
    margin-bottom:10px;
    font-size:32px;
}

.login-box p{
    margin-bottom:25px;
    color:#f1f1f1;
}

.input-box{
    width:100%;
    padding:14px;
    margin:12px 0;
    border:none;
    border-radius:10px;
    outline:none;
    font-size:16px;
}

.login-btn{
    width:100%;
    padding:14px;
    margin-top:15px;
    border:none;
    border-radius:10px;
    background:#ff9f43;
    color:white;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.login-btn:hover{
    background:#ff6b6b;
    transform:scale(1.03);
}

.footer{
    margin-top:20px;
    font-size:14px;
    color:#f5f5f5;
}

</style>
</head>

<body>

<div class="login-box">

    <h1>🚀 Office Portal</h1>
    <p>Sign in to continue</p>

    <form>
        <input type="text"
               class="input-box"
               placeholder="Enter Employee ID"
               required>

        <input type="password"
               class="input-box"
               placeholder="Enter Password"
               required>

        <button class="login-btn">
            Login
        </button>
    </form>

    <div class="footer">
        © 2026 Office Management | Capgemini
    </div>

</div>

</body>
</html>
