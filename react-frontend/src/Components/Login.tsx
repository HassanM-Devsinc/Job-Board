// import React, { useRef } from "react";

// interface LoginProps {
//   setCurrUser: React.Dispatch<any>; 
//   setShow: React.Dispatch<React.SetStateAction<boolean>>;
// }

// const Login: React.FC<LoginProps> = ({ setCurrUser, setShow }) => {
//   const formRef = useRef<HTMLFormElement>(null);

//   const login = async (userInfo: { user: { email: string; password: string } }, setCurrUser: React.Dispatch<any>) => {
//     const url = "http://localhost:3000/api/v1/users/sign_in";
//     try {
//       const response = await fetch(url, {
//         method: "post",
//         headers: {
//           "content-type": "application/json",
//           accept: "application/json",
//         },
//         body: JSON.stringify(userInfo),
//       });
//       const data = await response.json();
//       if (!response.ok) throw data.error;
//       localStorage.setItem("token", response.headers.get("Authorization") || "");
//       setCurrUser(data);
//     } catch (error) {
//       console.log("error", error);
//     }
//   };

//   const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
//     e.preventDefault();
//     if (!formRef.current) return;
//     const formData = new FormData(formRef.current);
//     const data = Object.fromEntries(formData) as { email: string; password: string };
//     const userInfo = {
//       user: { email: data.email, password: data.password },
//     };
//     login(userInfo, setCurrUser);
//     formRef.current.reset();
//   };

//   const handleClick = (e: React.MouseEvent<HTMLAnchorElement, MouseEvent>) => {
//     e.preventDefault();
//     setShow(false);
//   };

//   return (
//     <div>
//       <form ref={formRef} onSubmit={handleSubmit}>
//         Email: <input type="email" name="email" placeholder="email" />
//         <br />
//         Password: <input type="password" name="password" placeholder="password" />
//         <br />
//         <input type="submit" value="Login" />
//       </form>
//       <br />
//       <div>
//         Not registered yet, <a href="#signup" onClick={handleClick}>Signup</a>
//       </div>
//     </div>
//   );
// };

// export default Login;