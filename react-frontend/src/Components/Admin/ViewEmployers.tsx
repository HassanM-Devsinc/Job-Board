import { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';

interface Employer {
  id: number;
  username: string;
  email: string;
}

export default function ViewEmployers() {
  const [employers, setEmployers] = useState<Employer[]>([]);

  useEffect(() => {
    const getAllEmployers = async () => {
      const token = localStorage.getItem("token");
      try {
        const response = await axios.get('http://localhost:3000/api/v1/members', {
          headers: {
            'accept': 'application/json',
            'authorization': token
          },
        });
        setEmployers(response.data);
      } catch (error) {
        console.error('Error fetching Employers: ', error);
      }
    };

    getAllEmployers();
  }, []);

  return (
    <div className="max-w-screen-xl mx-auto p-4">
      <h1 className="text-2xl font-semibold text-gray-900 dark:text-white mb-6">Employer Details</h1>

      {employers.map(employer => (
        <div key={employer.id} className="bg-white rounded-lg shadow-md p-6 border border-gray-200 dark:bg-gray-800 dark:border-gray-700 mb-4">
          <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
            <strong className="font-semibold">Employer Username:</strong> {employer.username}
          </p>
          <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
            <strong className="font-semibold">Employer Email:</strong> {employer.email}
          </p>
        </div>
      ))}

      <div className="mt-6">
        <Link to="/" className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 text-lg font-medium">
          Back
        </Link>
      </div>
    </div>
  );
}
