import React from "react";
import { Link } from "react-router-dom";
import { Button } from "bootstrap";

export default () => (
  <div className="vw-100 vh-100 primary-color d-flex align-items-center justify-content-center">
    <div className="jumbotron jumbotron-fluid bg-transparent">
      <div className="container secondary-color">
        <h1 className="display-4">Ask Sherlock Holmes</h1>
        <p className="lead">
          Ask anything about <em>The Adventures of Sherlock Holmes</em> by Arthur Conan Doyle
        </p>
        <hr className="my-4" />
        <Link
          to="/recipes"
          className="btn btn-lg custom-button"
          role="button"
        >
          Ask Question
        </Link>
      </div>
    </div>
  </div>
);