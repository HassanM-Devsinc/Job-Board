import { Link } from "react-router-dom";

export default function Home() {
  const userType = localStorage.getItem('currUser');

  return (
    <section className="mt-52 flex flex-col justify-center items-center px-6 py-12 space-y-6">
      {userType === 'employer' && (
        <div className="flex flex-row space-x-12">
          <div className="relative">
            <div className="absolute -inset-5">
              <div className="w-full h-full max-w-sm mx-auto lg:mx-0 opacity-30 blur-lg"></div>
            </div>
            <Link to="/jobs/new">
              <button className="relative z-10 inline-flex items-center justify-center px-8 py-3 text-lg font-bold text-white transition-all duration-200 bg-gray-900 border-2 border-transparent rounded-xl hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900">
                Post new Job
              </button>
            </Link>
          </div>
          <div className="relative">
            <div className="absolute -inset-5">
              <div className="w-full h-full max-w-sm mx-auto lg:mx-0 opacity-30 blur-lg"></div>
            </div>
            <Link to="/jobs">
              <button className="relative z-10 inline-flex items-center justify-center px-8 py-3 text-lg font-bold text-white transition-all duration-200 bg-gray-900 border-2 border-transparent rounded-xl hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900">
                My Jobs
              </button>
            </Link>
          </div>
        </div>
      )}

      {userType === 'job_seeker' && (
        <div className="flex flex-row space-x-12">
          <div className="relative">
            <div className="absolute -inset-5">
              <div className="w-full h-full max-w-sm mx-auto lg:mx-0 opacity-30 blur-lg"></div>
            </div>
            <Link to="/">
              <button className="relative z-10 inline-flex items-center justify-center px-8 py-3 text-lg font-bold text-white transition-all duration-200 bg-gray-900 border-2 border-transparent rounded-xl hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900">
                View all Job Openings
              </button>
            </Link>
          </div>
        </div>
      )}

      {userType === 'admin' && (
        <div className="flex flex-row space-x-12">
          <div className="relative">
            <div className="absolute -inset-5">
              <div className="w-full h-full max-w-sm mx-auto lg:mx-0 opacity-30 blur-lg"></div>
            </div>
            <Link to="/">
              <button className="relative z-10 inline-flex items-center justify-center px-8 py-3 text-lg font-bold text-white transition-all duration-200 bg-gray-900 border-2 border-transparent rounded-xl hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900">
                Add new employer
              </button>
            </Link>
          </div>
          <div className="relative">
            <div className="absolute -inset-5">
              <div className="w-full h-full max-w-sm mx-auto lg:mx-0 opacity-30 blur-lg"></div>
            </div>
            <Link to="/employers">
              <button className="relative z-10 inline-flex items-center justify-center px-8 py-3 text-lg font-bold text-white transition-all duration-200 bg-gray-900 border-2 border-transparent rounded-xl hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-900">
                View all employers
              </button>
            </Link>
          </div>
        </div>
      )}
    </section>
  );
}
