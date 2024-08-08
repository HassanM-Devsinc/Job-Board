import { useState, useEffect } from 'react';
import axios from 'axios';
import { useNavigate, useParams } from 'react-router-dom';

interface Applicant {
  id: number;
  name: string;
  email: string;
  cnic: string;
  linkedin_profile: string;
  resume: string;
}

export default function ShowApplicants() {
  const [applicants, setApplicants] = useState<Applicant[]>([]);
  const navigate = useNavigate();
  const { jobId } = useParams();

  useEffect(() => {
    const fetchApplicants = async () => {
      try {
        const token = localStorage.getItem('token');
        const response = await axios.get(`http://localhost:3000/api/v1/jobs/${jobId}/applicants`, {
          headers: {
            authorization: token,
            accept: 'application/json',
          },
        });
        setApplicants(response.data);
      } catch (error) {
        console.error('Error fetching applicants: ', error);
      }
    };

    fetchApplicants();
  }, []);

  const handleBack = () => {
    navigate('/jobs');
  };

  return (
    <div className="max-w-screen-xl mx-auto p-4">
      <h2 className="text-2xl font-semibold text-gray-900 dark:text-white mb-6">Current Applicants</h2>

      {applicants.length > 0 ? (
        <div className="flex flex-col space-y-6">
          {applicants.map(applicant => (
            <div key={applicant.id} className="bg-white rounded-lg shadow-md p-6 border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
              <div className="mb-4">
                <p className="text-lg font-semibold text-gray-900 dark:text-white">
                  <strong>Name:</strong> {applicant.name}
                </p>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  <strong>Email:</strong> {applicant.email}
                </p>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  <strong>CNIC:</strong> {applicant.cnic}
                </p>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  <strong>LinkedIn Url:</strong> <a href={applicant.linkedin_profile} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300">{applicant.linkedin_profile}</a>
                </p>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  <strong>Resume:</strong> <a href={applicant.resume} target="_blank" rel="noopener noreferrer" className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300">{applicant.resume.split('/').pop()}</a>
                </p>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-gray-600 dark:text-gray-400">No Applicants yet</p>
      )}

      <div className="mt-6">
        <button onClick={handleBack} className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 text-lg font-medium">
          Back
        </button>
      </div>
    </div>
  );
};
