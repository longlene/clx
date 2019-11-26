# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Grit is a Ruby library for extracting information from a git repository in an object oriented manner"
HOMEPAGE="http://github.com/mojombo/grit"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/diff-lcs-1.1"
ruby_add_rdepend ">=dev-ruby/mime-types-1.15"
ruby_add_rdepend ">=dev-ruby/posix-spawn-0.3.6"

