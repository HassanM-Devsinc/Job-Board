import { useState } from 'react';
import User from './Components/User';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import UpdateJob from "./Components/UpdateJob";
import ViewJobs from './Components/ViewJobs';
import PostJob from './Components/PostJob';
// import PrivateText from './Components/PrivateText';

export default function App () {
  const [currUser, setCurrUser] = useState([]);
  
  return (
    <div>
      {/* <BrowserRouter>
        <Routes>
          <Route path="/" element={<EmployerHome />} />
          <Route path="jobs/new" element={<PostJob />} />
          <Route path="jobs" element={<ViewJobs />} />
          <Route path="/jobs/:jobId/edit" element={<UpdateJob/>} />
        </Routes>
      </BrowserRouter> */}
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<User currUser={currUser} setCurrUser={setCurrUser} />} />
          <Route path="jobs/new" element={<PostJob />} />
          <Route path="jobs" element={<ViewJobs />} />
          <Route path="/jobs/:jobId/edit" element={<UpdateJob/>} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}