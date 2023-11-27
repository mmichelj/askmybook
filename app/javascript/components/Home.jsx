import React from "react";
import Image from '../../../public/cover.jpg'

const Home = () => {
    return (
        <React.Fragment>
            <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                        <img src={Image} class="rounded mx-auto mb-4" alt="Book cover" />
                        <h1 className="display-4">Ask Sherlock Holmes</h1>
                        <p className="lead">
                        Ask anything about <em>The Adventures of Sherlock Holmes</em> by Arthur Conan Doyle
                        </p>
                        <hr className="my-4" />
                        <textarea class="form-control" aria-label="With textarea"></textarea>
                        <div class="d-grid gap-3 d-md-flex mt-4">
                            <button class="btn btn-lg btn-primary me-md-2" type="button">Ask Question</button>
                            <button class="btn btn-secondary btn-lg" type="button">I'm feeling lucky!</button>
                        </div>
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}
 
export default Home;