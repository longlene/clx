# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="add content negogiation, serialization of objects (their attributes map), and some helpers for authentication + authorization to the cuba framework"
HOMEPAGE="http://github.com/mkristian/cuba-api"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cuba-3.1"
ruby_add_rdepend ">=dev-ruby/ixtlan-babel-0.4"
ruby_add_rdepend ">=dev-ruby/safe_yaml-0.8"
ruby_add_rdepend ">=dev-ruby/multi_json-1.6"
ruby_add_rdepend ">=dev-ruby/json-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/mustard-0.1"
ruby_add_rdepend ">=dev-ruby/ixtlan-user-management-0.2"

