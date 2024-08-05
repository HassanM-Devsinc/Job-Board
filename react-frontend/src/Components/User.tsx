import React, { useState } from 'react';
import Signup from './Signup';
import Login from './Login';
import Logout from './Logout';
import PrivateText from "./PrivateText";

interface UserProps {
  currUser: any;
  setCurrUser: React.Dispatch<any>;
}

const User: React.FC<UserProps> = ({ currUser, setCurrUser }) => {
  const [show, setShow] = useState(true);

  if (currUser) 
    return (
      <div>
        Hello {currUser.email}
        <PrivateText currUser={currUser} />
        <Logout setCurrUser={setCurrUser} />
      </div>
    );

  return (
    <div>
      {show ? (
        <Login setCurrUser={setCurrUser} setShow={setShow} />
      ) : (
        <Signup setCurrUser={setCurrUser} setShow={setShow} />
      )}
    </div>
  );
}

export default User;
