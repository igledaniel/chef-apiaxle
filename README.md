# apiaxle-cookbook

[![Build Status](https://circleci.com/gh/mapzen/chef-apiaxle.svg?style=svg)](https://circleci.com/gh/mapzen/chef-apiaxle)

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['apiaxle']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### apiaxle::default

Include `apiaxle` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[apiaxle::default]"
  ]
}
```

## License and Authors

Author:: Baldur Gudbjornsson (baldur@mapzen.com)
