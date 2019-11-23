# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Transport interface to talk to different backends"
HOMEPAGE="https://github.com/chef/train/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/mixlib-shellout-2.0"
ruby_add_rdepend ">=dev-ruby/net-ssh-2.9"
ruby_add_rdepend ">=dev-ruby/net-scp-1.2"
ruby_add_rdepend ">=dev-ruby/winrm-2.0"
ruby_add_rdepend ">=dev-ruby/winrm-fs-1.0"
ruby_add_rdepend ">=dev-ruby/docker-api-1.26"
ruby_add_rdepend ">=dev-ruby/mocha-1.1"

