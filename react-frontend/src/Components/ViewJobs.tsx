import {useState, useEffect} from 'react';
import axios from 'axios';
import { useNavigate } from "react-router-dom";

interface Job {
  id: number;
  title: string;
  description: string;
  application_deadline: string;
}

export default function ViewJobs()  {
  const [jobs, setJobs] = useState<Job[]>([]);
  const navigate = useNavigate();

  useEffect(() => {
    const getAllJobs = async () => {
      try {
        const response = await axios.get('http://localhost:3000/api/v1/jobs');
        setJobs(response.data);
      } catch (error) {
        console.error('Error fetching jobs: ', error);
      }
    };
    getAllJobs();
  }, []);

  const handleDelete = async (jobId: number) => {
    if (window.confirm('Are you sure?')) {
      try {
        await axios.delete(`http://localhost:3000/api/v1/jobs/${jobId}`);
        setJobs(jobs.filter(job => job.id !== jobId));
      } catch (error) {
        console.error('Error deleting job: ', error);
      }
    }
  };

  const handleBack = () => {
    navigate("/");
  };

  return (
    <div className="max-w-screen-xl mx-auto p-4">
      <h2 className="text-2xl font-semibold text-gray-900 dark:text-white mb-6">Current Jobs</h2>
      {jobs.length > 0 ? (
        <div className="flex flex-col space-y-6">
          {jobs.map(job => (
            <div key={job.id} className="bg-white rounded-lg shadow-md p-6 border border-gray-200 dark:bg-gray-800 dark:border-gray-700" >
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white mb-2">
                <strong>Job Title:</strong> {job.title}
              </h3>
              <p className="text-sm text-gray-600 dark:text-gray-400 mb-1">
                <strong>Description:</strong> {job.description}
              </p>
              <p className="text-sm text-gray-600 dark:text-gray-400 mb-2">
                <strong>Application Deadline:</strong> {job.application_deadline}
              </p>
              <div className="flex flex-col space-y-2">
                <div>
                  <button onClick={() => handleDelete(job.id)} className="inline-flex items-center px-4 py-2 text-sm font-semibold text-white bg-red-600 border border-transparent rounded-lg shadow-sm hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2">
                    Delete Job
                  </button>
                </div>
                <div>
                  <button className="inline-flex items-center px-4 py-2 text-sm font-semibold text-white bg-yellow-600 border border-transparent rounded-lg shadow-sm hover:bg-yellow-700 focus:outline-none focus:ring-2 focus:ring-yellow-500 focus:ring-offset-2">
                    Edit Job
                  </button>
                </div>
                <div>
                  <button className="inline-flex items-center px-4 py-2 text-sm font-semibold text-white bg-green-600 border border-transparent rounded-lg shadow-sm hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2">
                    Show Applicants
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      ) : (
        <p className="text-gray-600 dark:text-gray-400">No Jobs Posted yet</p>
      )}
      <div className="mt-6">
        <button onClick={handleBack} className="text-blue-600 hover:text-blue-800 dark:text-blue-400 dark:hover:text-blue-300 text-lg font-medium" >
          Back
        </button>
      </div>
    </div>
  );
};