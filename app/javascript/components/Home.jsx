import React from "react";
import QuestionAnswer from "./QuestionAnswer";
import Greeting from "./Greeting";

const Home = () => {
    return (
        <React.Fragment>
            <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
                <div className="jumbotron jumbotron-fluid bg-transparent">
                    <div className="container secondary-color">
                        <Greeting/>
                        <QuestionAnswer />
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}
 
export default Home;