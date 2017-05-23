# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Pronto runs analysis quickly by checking only the relevant changes"
HOMEPAGE="http://github.com/mmozuras/pronto"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rugged-0.23.0"
ruby_add_rdepend ">=dev-ruby/thor-0.19.0"
ruby_add_rdepend ">=dev-ruby/octokit-4.1.0"
ruby_add_rdepend ">=dev-ruby/gitlab-3.4.0"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rspec-3.3"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.2"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-3.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0.10"

