class Home extends React.Component {
  render() {
    let questionItems = this.props.questions.map((question, index) =>
      <QuestionItem key={index} question={question}></QuestionItem>
    )
    return(
      <div class="container px-2">
        <div class="overflow-auto mt-3">
          <h4 class="d-inline-block float-start">Top Questions</h4>
          <div class="d-inline-block float-end">
            <a href="/questions/new" class="btn btn-primary"> Ask Question </a>
          </div>
        </div>
        <div class="mt-3">
          <table class="table table-stripe">
            <tbody>
              {questionItems}
            </tbody>
          </table>
        </div>
      </div>
    )
  }
}
