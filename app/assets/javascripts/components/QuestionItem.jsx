class QuestionItem extends React.Component {
  render() {
    return(
      <tr>
        <td>
          <div className="d-inline-block mt-2">
            <span className="badge bg-success">{ this.getAnswersCount() }</span>
            <div className="d-inline-block">
              <a href={`/questions/${this.props.question.id}`} className="text-decoration-none p-2"> { this.props.question.title } </a>
            </div>
          </div>
          <div className="d-inline-block float-end">
            <span className="fst-italic extra-info">Asked by: { this.props.question.user.email }</span>
            <span className="d-block extra-info">{ this.props.question.created_at }</span>
          </div>
        </td>
      </tr>
    )
  }

  getAnswersCount() {
    let label = "Answers";
    const answersCount = this.props.question.answers_count;

    if(answersCount == 1) {
      label = "Answer"
    }

    return answersCount + " " + label;
  }
}
