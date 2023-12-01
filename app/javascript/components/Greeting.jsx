import React from "react";

const Greeting = () => {
    
    return (
        <React.Fragment>
            <img src="https://images.booksense.com/images/512/282/9781788282512.jpg" className="rounded mx-auto mb-4" alt="Book cover" />
            <h1 className="display-4">Ask Sherlock Holmes</h1>
            <p className="lead">Ask anything about <em>The Adventures of Sherlock Holmes</em> by Arthur Conan Doyle.</p>
            <hr className="my-4" />
        </React.Fragment>
    )
} 

export default Greeting;