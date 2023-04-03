# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="runs analysis quickly by checking only the relevant changes"
HOMEPAGE="https://github.com/prontolabs/pronto"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rugged-0.24"
ruby_add_rdepend ">=dev-ruby/thor-0.19.0"
ruby_add_rdepend ">=dev-ruby/octokit-4.7"
ruby_add_rdepend ">=dev-ruby/gitlab-4.0"
ruby_add_rdepend ">=dev-ruby/httparty-0.13.7"
ruby_add_rdepend ">=dev-ruby/rainbow-2.1"
