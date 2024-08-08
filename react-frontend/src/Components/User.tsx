import Login from './Login';
import Home from './Home';
import { useEffect,useState } from 'react';

export default function User() {
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
      <Login setIsAuthenticated={setIsAuthenticated} />
    </div>
  );
}
