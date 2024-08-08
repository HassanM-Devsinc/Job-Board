import User from './Components/User';
import { Routes, Route } from "react-router-dom";
import UpdateJob from "./Components/UpdateJob";
import ViewJobs from './Components/ViewJobs';
import PostJob from './Components/PostJob';
import ShowApplicants from './Components/ShowApplicants';
import Navbar from './Components/Navbar';
import UseAuth from './Components/UseAuth';

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
        </Routes>
      </UseAuth>
    </div>
  );
}