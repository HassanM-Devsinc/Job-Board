import Login from './Login';
import Home from './Home';
import { useEffect,useState } from 'react';

interface UserProps {
  currUser: any;
  setCurrUser: (user: any) => void;
}

export default function User({ currUser, setCurrUser }: UserProps) {
  const [isAuthenticated, setIsAuthenticated] = useState<boolean>(false);

  useEffect(() => {
    const token = localStorage.getItem('token');
    setIsAuthenticated(!!token);
  }, [isAuthenticated]);

  if (isAuthenticated) {
    return (
      <div>
        <Home />
      </div>
    );
  }

  return (
    <div>
      <Login setCurrUser={setCurrUser} />
    </div>
  );
}
