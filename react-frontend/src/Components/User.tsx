import Login from './Login';
import Home from './Home';

interface UserProps {
  currUser: any;
  setCurrUser: (user: any) => void;
}

export default function User({ currUser, setCurrUser }: UserProps) {
  const isEmptyArray = Array.isArray(currUser) && currUser.length === 0;

  if (currUser && !isEmptyArray) {
    return (
      <div>
        <Home/>
      </div>
    );
  }

  return (
    <div>
      <Login setCurrUser={setCurrUser} />
    </div>
  );
}
