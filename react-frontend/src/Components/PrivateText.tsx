import React, { useState, useEffect } from "react";
import axios from 'axios';

const PrivateText: React.FC = () => {
  const [message, setMessage] = useState<string | null>(null);

  const getText = async () => {
    try {
      const response = await axios.get("http://localhost:3000/api/v1/private/test", {
        headers: {
         "content-type": "application/json",
          "authorization": localStorage.getItem("token")
        }
      });
      setMessage(response.data.message);
    } catch (error) {
      console.log("Error fetching private text:", error);
    }
  };

  useEffect(() => {
    getText();
  }, []);

  return (
    <div>
      <p>{message}</p>
    </div>
  );
};

export default PrivateText;
