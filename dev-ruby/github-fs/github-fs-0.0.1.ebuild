# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Creating, updating, deleting files on the github api using the same APIs as you would working with files your local file system"
HOMEPAGE="https://github.com/architects/github-fs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/octokit-0"
ruby_add_rdepend ">=dev-ruby/rack-0"
ruby_add_rdepend ">dev-ruby/activesupport-3.2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">dev-ruby/rspec-3.0.0"
ruby_add_rdepend ">=dev-ruby/pry-0"

