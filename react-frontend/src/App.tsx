// import { useState } from 'react';
// import User from './Components/User';
import EmployerHome from './Components/EmployerHome';
import PostJob from './Components/PostJob';
import { BrowserRouter, Routes, Route } from "react-router-dom";
// import UpdateJob from './Components/UpdateJob';
import ViewJobs from './Components/ViewJobs';

export default function App () {
  // const [currUser, setCurrUser] = useState<any>(null);
  
  return (
    <div>
      {/* <User currUser={currUser} setCurrUser={setCurrUser} /> */}
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<EmployerHome />} />
          <Route path="jobs/new" element={<PostJob />} />
          <Route path="jobs" element={<ViewJobs />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}