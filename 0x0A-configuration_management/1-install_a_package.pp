# Task 1 - Install flask v. 2.1.1
package { 'flask':
  ensure   => '2.1.0',
  provider => 'gem',
}