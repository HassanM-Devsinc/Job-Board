// import React from "react";

// interface LogoutProps {
//   setCurrUser: React.Dispatch<any>; // Use 'any' type for now
// }

// const Logout: React.FC<LogoutProps> = ({ setCurrUser }) => {
//   const logout = async (setCurrUser: React.Dispatch<any>) => {
//     try {
//       const response = await fetch("http://localhost:3000/api/v1/users/sign_out", {
//         method: "delete",
//         headers: {
//           "content-type": "application/json",
//           authorization: localStorage.getItem("token") || "",
//         },
//       });
//       const data = await response.json();
//       if (!response.ok) throw data.error;
//       localStorage.removeItem("token");
//       setCurrUser(null);
//     } catch (error) {
//       console.log("error", error);
//     }
//   };

//   const handleClick = (e: React.MouseEvent<HTMLInputElement, MouseEvent>) => {
//     e.preventDefault();
//     logout(setCurrUser);
//   };

//   return (
//     <div>
//       <input type="button" value="Logout" onClick={handleClick} />
//     </div>
//   );
// };

// export default Logout;
