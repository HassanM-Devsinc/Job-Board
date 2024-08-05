// import React, { useRef } from "react";

// interface SignupProps {
//   setCurrUser: React.Dispatch<any>;
//   setShow: React.Dispatch<React.SetStateAction<boolean>>;
// }

// const Signup: React.FC<SignupProps> = ({ setCurrUser, setShow }) => {
//   const formRef = useRef<HTMLFormElement>(null);

//   const signup = async (userInfo: { user: { username: string; email: string; password: string; password_confirmation: string } }, setCurrUser: React.Dispatch<any>) => {
//     const url = "http://localhost:3000/api/v1/users";
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
//     const data = Object.fromEntries(formData) as { username: string; email: string; password: string; password_confirmation: string };
//     const userInfo = {
//       user: { username: data.username, email: data.email, password: data.password, password_confirmation: data.password_confirmation },
//     };
//     signup(userInfo, setCurrUser);
//     formRef.current.reset();
//   };

//   const handleClick = (e: React.MouseEvent<HTMLAnchorElement, MouseEvent>) => {
//     e.preventDefault();
//     setShow(true);
//   };

//   return (
//     <div>
//       <form ref={formRef} onSubmit={handleSubmit}>
//         Username: <input type="text" name="username" placeholder="username" />
//         <br />
//         Email: <input type="email" name="email" placeholder="email" />
//         <br />
//         Password: <input type="password" name="password" placeholder="password" />
//         <br />
//         Confirm Password: <input type="password" name="password_confirmation" placeholder="confirm password" />
//         <br />
//         <input type="submit" value="Submit" />
//       </form>
//       <br />
//       <div>
//         Already registered, <a href="#login" onClick={handleClick}>Login</a> here.
//       </div>
//     </div>
//   );
// };

// export default Signup;
