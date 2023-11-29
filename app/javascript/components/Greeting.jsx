import React from "react";
import Image from "../../../public/cover.jpg";

const Greeting = () => {
    
    return (
        <React.Fragment>
            <img src={Image} className="rounded mx-auto mb-4" alt="Book cover" />
            <h1 className="display-4">Ask Sherlock Holmes</h1>
            <p className="lead">Ask anything about <em>The Adventures of Sherlock Holmes</em> by Arthur Conan Doyle.</p>
            <hr className="my-4" />
        </React.Fragment>
    )
} 

export default Greeting;