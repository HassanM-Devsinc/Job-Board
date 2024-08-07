import React, { useState } from 'react';
import axios from "axios";

export default function Login({setCurrUser}: any) {

  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [rememberMe, setRememberMe] = useState(false);
  const [unauthorizeError, setUnauthorizeError] = useState("");

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    const payload = {
      user: {
        email,
        password
      },
    };

    try {
      const response = await axios.post(
        "http://localhost:3000/api/v1/users/sign_in",
        payload,
        {
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          }
        }
      );
      if (response.status === 200) {
        localStorage.setItem("token", response.headers['authorization'] || "");
        setCurrUser(response.data.user)
        console.log('Signed in successfully');
      } else {
        console.log("An unexpected error occurred.");
      }
    } catch (_error) {
      setUnauthorizeError('Invalid email or password');
    }
  };

  return (
    <div className="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
      <div className="sm:mx-auto sm:w-full sm:max-w-sm">
        <h2 className="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">
          Sign in to your account
        </h2>
      </div>

      <div className="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
        <form onSubmit={handleSubmit}>
          <div className="space-y-6">
            <div>
              <label className="block text-sm font-medium leading-6 text-gray-900">
                Email
              </label>
              <div className="mt-2">
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                  autoFocus
                  autoComplete="email"
                  className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                />
              </div>
            </div>

            <div>
              <div className="flex items-center justify-between">
                <label className="block text-sm font-medium leading-6 text-gray-900">
                  Password
                </label>
                <div className="text-sm">
                  <a className="font-semibold text-indigo-600 hover:text-indigo-500">
                    Forgot password?
                  </a>
                </div>
              </div>
              <div className="mt-2">
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                  autoComplete="current-password"
                  className="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                />
              </div>
            </div>

            <div className="flex items-center space-x-2">
              <input
                type="checkbox"
                checked={rememberMe}
                onChange={(e) => setRememberMe(e.target.checked)}
                className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-600"
              />
              <label className="text-sm font-medium text-gray-900">
                Remember me
              </label>
            </div>

            {unauthorizeError && (
              <div className="text-sm text-red-600">
                {unauthorizeError}
              </div>
            )}

            <div>
              <button
                type="submit"
                className="mb-3 flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
              >
                Sign in
              </button>
              <p className="text-center text-sm text-gray-500">
                Don't have an account?
              </p>
              <div className="text-center">
                <a className="font-semibold text-indigo-600 hover:text-indigo-500">
                  Sign up
                </a>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
}