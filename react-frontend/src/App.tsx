import { useState } from 'react';
// import User from './Components/User';
import { BrowserRouter, Routes, Route } from "react-router-dom";
// import UpdateJob from "./Components/UpdateJob";
// import ViewJobs from './Components/ViewJobs';
// import EmployerHome from './Components/EmployerHome';
// import PostJob from './Components/PostJob';
import Login from './Components/Login'
import PrivateText from './Components/PrivateText';

export default function App () {
  
  return (
    <div>
      {/* <User currUser={currUser} setCurrUser={setCurrUser} /> */}
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
          <Route path="/" element={<Login />} />
          <Route path="/private" element={<PrivateText />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}