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
                <footer className="footer fixed-bottom bg-transparent text-dark text-center p-3">
                Created by <a href="https://github.com/mmichelj/askmybook" className="text-reset">Miguel Michel</a>
                </footer>
            </div>
        </React.Fragment>
    );
}
 
export default Home;