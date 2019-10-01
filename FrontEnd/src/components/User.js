import React from "react";
import "./../App.css";

class User extends React.Component {
  render() {
    return (
      <div className="border">
        <p>
          {this.props.data.username} - {this.props.data.password}
        </p>
        {this.props.data.addresses.length > 0 ? (
          <p>
            {this.props.data.addresses[0].street},{" "}
            {this.props.data.addresses[0].city},{" "}
            {this.props.data.addresses[0].country}
          </p>
        ) : (
          <></>
        )}
      </div>
    );
  }
}

export default User;
