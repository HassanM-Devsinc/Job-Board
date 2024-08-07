import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function PostJob() {
  const [title, setTitle] = useState<string>("");
  const [description, setDescription] = useState<string>("");
  const [applicationDeadline, setApplicationDeadline] = useState<string>("");
  const navigate = useNavigate();

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    const token = localStorage.getItem("token");

    try {
      const response = await axios.post(
        "http://localhost:3000/api/v1/jobs",
        {
          job: {
            title,
            description,
            application_deadline: applicationDeadline,
          }
        },
        {
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
            'authorization': token
          }
        }
      );
      console.log("Job posted successfully: ", response.data);
      navigate("/");
    } catch (error) {
      console.error("Error posting job: ", error);
    }
  };

  const handleCancel = () => {
    navigate("/home");
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <div className="w-full max-w-5xl p-6 bg-white rounded-lg shadow-md">
        <h2 className="text-2xl font-semibold text-gray-900">Post New Job</h2>
        <form onSubmit={handleSubmit} className="space-y-6">
          <div className="border-b border-gray-900/10 pb-12">
            <div className="grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
              <div className="sm:col-span-6">
                <label htmlFor="job_title" className="block text-sm font-medium leading-6 text-gray-900">Title</label>
                <div className="mt-2">
                  <input
                    type="text"
                    id="job_title"
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                    className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>

              <div className="sm:col-span-6">
                <label htmlFor="job_description" className="block text-sm font-medium leading-6 text-gray-900">Description</label>
                <div className="mt-2">
                  <textarea
                    id="job_description"
                    rows={10}
                    value={description}
                    onChange={(e) => setDescription(e.target.value)}
                    className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 resize-none"
                  />
                </div>
              </div>

              <div className="sm:col-span-6">
                <label htmlFor="job_application_deadline" className="block text-sm font-medium leading-6 text-gray-900">Application Deadline</label>
                <div className="mt-2">
                  <input
                    type="datetime-local"
                    id="job_application_deadline"
                    value={applicationDeadline}
                    onChange={(e) => setApplicationDeadline(e.target.value)}
                    className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                  />
                </div>
              </div>
            </div>
          </div>

          <div className="mt-6 flex items-center justify-end gap-x-6">
            <button onClick={handleCancel} className="text-sm font-semibold leading-6 text-gray-900 hover:text-gray-600">
              Cancel
            </button>
            <button type="submit" className="rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
              Post Job
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
