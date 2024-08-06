// import React, { useState } from 'react';
// // import Signup from './Signup';
// import Login from './Login';
// // import Logout from './Logout';

// interface UserProps {
//   currUser: { email: string } | null;
//   setCurrUser: (user: { email: string } | null) => void;
// }

// const User: React.FC<UserProps> = ({ currUser, setCurrUser }) => {
//   const [show, setShow] = useState(true);

//   if (currUser) 
//     return (
//       <div>
//         Hello {currUser.email}
//         <PrivateText currUser={currUser}/>
//         {/* <Logout setCurrUser={setCurrUser}/> */}
//       </div>
//     );

//   return (
//     <div>
//       {show ? (
//         <Login setCurrUser={setCurrUser} setShow={setShow}/>  
//       ) : (
//         <Login setCurrUser={setCurrUser} setShow={setShow} />
//       )}
//     </div>
//   );
// };

// export default User;
