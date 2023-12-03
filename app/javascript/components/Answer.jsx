import React, { useState, useEffect } from 'react';

const Answer = (props) => {
    const [text, setText] = useState("")
    const [index, setIndex] = useState(0)
    const [prevAnswer, setPevAnswer] = useState("")

    const clearState = () => {
        setText("")
        setIndex(0)
        setPevAnswer(props.answer)
    }

    useEffect(() => {
        if(prevAnswer != props.answer) {
            console.log(prevAnswer)
            console.log(props.answer)
            clearState()
        }

        if(index < props.answer.length) {
          const timeout = setTimeout(() => {
            setText(prevText => prevText + props.answer[index]);
            setIndex(prevIndex => prevIndex + 1);
          }, props.delay);

          return () => clearTimeout(timeout);
        }
      }, [index, props.delay, props.answer]);
    
    return (
        <div className="jumbotron mt-4 rounded">
            {console.log(props.answer)}
            <div className="overflow-auto pe-2">
                <p className="text-black-wrap"><strong>Answer: </strong>{text}</p>
            </div>
        </div>
    )
}

export default Answer;