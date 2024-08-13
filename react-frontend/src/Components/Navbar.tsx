import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';
import { useAuth } from './UseAuth';

export default function Navbar() {
  const { isAuthenticated, setIsAuthenticated } = useAuth();
  const navigate = useNavigate();

  const token = localStorage.getItem('token');

  const handleSignOut = async () => {
    try {
      await axios.delete('http://localhost:3000/api/v1/users/sign_out', {
        headers: {
          'authorization': token,
          'content-type': 'application/json'
        },
      });

      localStorage.removeItem('token');
      localStorage.removeItem('currUser');
      setIsAuthenticated(false);
      navigate("/")
    } catch (error) {
      console.error('Error signing out: ', error);
    }
  };

  if (!isAuthenticated) {
    return null;
  }

  return (
    <nav className="bg-teal-800">
      <div className="flex flex-wrap items-center justify-between mx-auto p-4">
        <Link to="/" className="flex items-center space-x-3 rtl:space-x-reverse">
          <img src="https://flowbite.com/docs/images/logo.svg" className="h-8" alt="Job Board Logo" />
          <span className="self-center text-2xl font-semibold whitespace-nowrap text-white">Job Board</span>
        </Link>
        <button
          data-collapse-toggle="navbar-default"
          type="button"
          className="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-transparent focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
          aria-controls="navbar-default"
          aria-expanded="false"
        >
          <span className="sr-only">Open main menu</span>
          <svg className="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
            <path stroke="white" strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M1 1h15M1 7h15M1 13h15" />
          </svg>
        </button>
        <div className="hidden w-full md:block md:w-auto" id="navbar-default">
          <ul className="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-teal-800 dark:bg-teal-800 md:dark:bg-teal-900 dark:border-gray-700">
            <li>
              <button className="block py-2 px-3 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-white-700 md:p-0 dark:text-white md:dark:hover:text-white-100 dark:hover:bg-teal-700 dark:hover:text-white md:dark:hover:bg-transparent">
                Edit Profile
              </button>
            </li>
            <li>
              <button
                onClick={handleSignOut}
                className="block py-2 px-3 text-white rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-white-700 md:p-0 dark:text-white md:dark:hover:text-white-100 dark:hover:bg-teal-700 dark:hover:text-white md:dark:hover:bg-transparent"
              >
                Sign out
              </button>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  );
};