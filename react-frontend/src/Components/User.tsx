import Login from './Login';
import Home from './Home';
import { useAuth } from './UseAuth';

export default function User() {
  const { isAuthenticated } = useAuth();

  if (isAuthenticated) {
    return (
      <div>
        <Home />
      </div>
    );
  }

  return (
    <div>
      <Login />
    </div>
  );
}