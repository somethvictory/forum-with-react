class Home extends React.Component {
  render() {
    let questionItems = this.props.questions.map((question, index) =>
      <QuestionItem key={index} question={question}></QuestionItem>
    )

    return(
      <div className="container px-2">
        <div className="overflow-auto mt-3">
          <h4 className="d-inline-block float-start">Top Questions</h4>
          <div className="d-inline-block float-end">
            <a href="/questions/new" className="btn btn-primary"> Ask Question </a>
          </div>
        </div>
        <div className="mt-3">
          <table className="table table-stripe">
            <tbody>
              {questionItems}
            </tbody>
          </table>
        </div>
      </div>
    )
  }
}
