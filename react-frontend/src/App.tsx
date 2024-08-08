import User from './Components/User';
import { Routes, Route } from "react-router-dom";
import UpdateJob from "./Components/Employer/UpdateJob";
import ViewJobs from './Components/Employer/ViewJobs';
import PostJob from './Components/Employer/PostJob';
import ShowApplicants from './Components/Employer/ShowApplicants';
import Navbar from './Components/Navbar';
import UseAuth from './Components/UseAuth';
import ViewEmployers from './Components/Admin/ViewEmployers';

export default function App() {
  return (
    <div>
      <UseAuth>
        <Navbar />
        <Routes>
          <Route path="/" element={<User />} />
          <Route path="jobs/new" element={<PostJob />} />
          <Route path="jobs" element={<ViewJobs />} />
          <Route path="/jobs/:jobId/edit" element={<UpdateJob />} />
          <Route path="/jobs/:jobId/applicants" element={<ShowApplicants />} />
          <Route path="employers" element={<ViewEmployers />} />
        </Routes>
      </UseAuth>
    </div>
  );
}